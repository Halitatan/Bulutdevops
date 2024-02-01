# Kullanılacak olan temel imajı belirle
FROM python:3.9
# Çalışma dizini olarak /app'i ayarla
WORKDIR /app
# Lokaldeki yazilim_ots-0.0.1-SNAPSHOT.jar'ı /app dizinine kopyala
#COPY target/Bulutdevops-0.0.1-SNAPSHOT.py app.py
COPY target/Bulutdevops-0.0.1-SNAPSHOT.py .
# Docker konteyner başlatıldığında çalıştırılacak komutu belirle
ENTRYPOINT ["python", "app.py"]

