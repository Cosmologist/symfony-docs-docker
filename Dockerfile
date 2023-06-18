FROM debian:latest

RUN apt update && apt -y --no-install-recommends install git php-cli php-curl php-dom composer && \
git clone https://github.com/symfony/symfony-docs && \
cd symfony-docs/_build && composer install --ignore-platform-reqs && php build.php && \
apt purge -y git php-curl php-dom composer && \
apt autoremove -y && \
apt clean && \
rm -rf /var/lib/apt/lists/*

EXPOSE 8000
CMD php -S 0.0.0.0:8000 -t symfony-docs/_build/output/
