FROM python:3.8-slim

WORKDIR /app

# COPY requirements.txt .

# RUN pip install -r requirements.txt
COPY DIALOGUE.ogg /app/DIALOGUE.ogg

RUN apt-get update && apt-get install -y git ffmpeg

# Install any needed packages specified in requirements.txt
RUN pip install "git+https://github.com/m-bain/whisperX.git"

# RUN pip install whisperx

RUN pip install torchaudio

RUN pip install torch torchvision

COPY . .

# Run the script when the container launches
CMD ["python", "./app.py"]
