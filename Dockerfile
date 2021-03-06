FROM wordpress

RUN apt-get update && apt-get install -y libmagickwand-6.q16-dev --no-install-recommends \
&& ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
&& pecl install imagick \
&& echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

RUN apt-get update \
&& apt-get install -y libfreetype6-dev \
&& docker-php-ext-configure gd --with-freetype-dir=/usr \
&& docker-php-ext-install gd
