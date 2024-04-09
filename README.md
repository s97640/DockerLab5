# Lab 5 - Programowanie w chmurze obliczeniowej

To repozytorium zawiera Dockerfile i inne pliki potrzebne do skonstruowania obrazu Dockera zawierającego serwer Nginx, który hostuje aplikację Express.js

## Instrukcje

Aby skonstruować obraz i uruchomić kontener Docker, postępuj zgodnie z poniższymi krokami:

1. **Klonowanie repozytorium:**

    Sklonuj to repozytorium na swój lokalny komputer:

    ```bash
    git clone https://github.com/s97640/DockerLab5
    ```

2. **Budowa obrazu Docker:**

    Przejdź do katalogu z repozytorium i zbuduj obraz Docker za pomocą polecenia `docker build`.

    ```bash
    cd DockerLab5
    docker build --build-arg VERSION=1.0.0 -t local/lab5 .
    ```

3. **Uruchomienie kontenera:**

    Po zakończeniu budowy obrazu, uruchom kontener Docker, używając polecenia `docker run`.

    ```bash
    docker run -d -p 80:80 local/lab5
    ```

4. **Sprawdzenie działania:**

    Otwórz przeglądarkę internetową i przejdź do adresu `http://localhost`, aby sprawdzić, czy serwer Nginx działa poprawnie.


[![image.png](https://i.postimg.cc/LXbJRLxH/image.png)](https://postimg.cc/vg5YtgRj)
[![image.png](https://i.postimg.cc/2yWhK0Cp/image.png)](https://postimg.cc/K3Z1KrKQ)

## Struktura katalogów

- `Dockerfile`: Plik Dockerfile definiujący budowę obrazu Docker.
- `index.js`: Plik Express.js wyświetlający informacje serwerze i wersji aplikacji.
- `default.conf`: Konfiguracja serwera Nginx do stworzenia proxy na localhost:3000
- `package.json`: Plik zawierający podstawowe informacje i zależności.
- `readme.md`: Plik README zawierający instrukcje i opis zadania.

## Autor

- Imię i nazwisko: Jakub Kopacki
- Email: s97640@pollub.edu.pl