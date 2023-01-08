#!/bin/bash

# İzleme yolunu tanımlar
path="/home/programmer/bsm"

# Yapılan değişiklikler tutacak dosya
log_file="kayit.txt"

# İzlenecek olayları tanımlar : Oluşturma Silme Düzenleme Taşıma
events="CREATE,DELETE,MODIFY,MOVE"

# Inotify toolsu ile değişiklikler izlenir
inotifywait -m -e "$events" --format '%w%f %e' "$path" |
    while read file event; do
        # Olayları log dosyasına ekle
        echo "$(date): $file $event" >> "$log_file"
    done