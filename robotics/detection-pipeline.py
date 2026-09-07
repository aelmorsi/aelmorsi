import sounddevice as sd
import numpy as np
import tensorflow as tf
import csv
from datetime import datetime

interpreter = tf.lite.Interpreter(model_path="yamnet.tflite")
interpreter.allocate_tensors()
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

CLASS_NAMES = open("yamnet_class_map.csv").read().splitlines()[1:]
BARK_INDEXES = [i for i, line in enumerate(CLASS_NAMES) if "Bark" in line or "Dog" in line]

SAMPLE_RATE = 16000
CHUNK_SECONDS = 1

def classify(audio_chunk):
    waveform = audio_chunk.astype(np.float32) / 32768.0
    interpreter.resize_tensor_input(input_details[0]['index'], [len(waveform)])
    interpreter.allocate_tensors()
    interpreter.set_tensor(input_details[0]['index'], waveform)
    interpreter.invoke()
    scores = interpreter.get_tensor(output_details[0]['index'])
    mean_scores = scores.mean(axis=0)
    bark_confidence = max(mean_scores[i] for i in BARK_INDEXES)
    return bark_confidence

def estimate_direction(multichannel_audio):
    # Simple energy-based direction estimate across the 4 mic channels:
    # the channel with the highest RMS energy indicates the nearest bearing.
    energies = [np.sqrt(np.mean(ch.astype(np.float32) ** 2)) for ch in multichannel_audio.T]
    bearings = ["front", "right", "back", "left"]
    return bearings[int(np.argmax(energies))]

def log_event(direction, confidence):
    with open("bark_log.csv", "a", newline="") as f:
        csv.writer(f).writerow([datetime.now().isoformat(), direction, round(float(confidence), 3)])

stream = sd.InputStream(samplerate=SAMPLE_RATE, channels=4, dtype='int16')
stream.start()

print("Scanning for barking...")
while True:
    audio, _ = stream.read(SAMPLE_RATE * CHUNK_SECONDS)
    mono = audio.mean(axis=1).flatten()
    confidence = classify(mono)
    if confidence > 0.5:
        direction = estimate_direction(audio)
        log_event(direction, confidence)
        print(f"Bark detected, confidence {confidence:.2f}, direction: {direction}")
