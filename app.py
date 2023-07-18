import whisper

model = whisper.load_model("large")
# result = model.transcribe("audio.mp3")

# load audio and pad/trim it to fit 30 seconds
audio = whisper.load_audio("audio.mp3")

# make log-Mel spectrogram and move to the same device as the model
mel = whisper.log_mel_spectrogram(audio).to(model.device)

# detect the spoken language
_, probs = model.detect_language(mel)
print(f"Detected language: {max(probs, key=probs.get)}")

# decode the audio
options = whisper.DecodingOptions()
result = whisper.decode(model, mel, options)


print(result["text"])