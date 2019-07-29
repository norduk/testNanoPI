#!/bin/bash
echo "\033[37;1;41m start i2cdetect \033[0m"
i2cdetect -y 1
echo "\033[37;1;41m i2cdump \033[0m"
read varname
i2cdump -y 1 0x$varname

#Проверка 10 порта ()
echo "\033[37;1;41m Проверка 10 порта \033[0m"
i2cset -y 1 0x22 0x0d 0xfe
i2cset -y 1 0x22 0x05 0xfe
echo "================"
i2cget -y 1 0x22 0x0d
i2cget -y 1 0x22 0x05
sleep 1
i2cset -y 1 0x22 0x05 0xff
i2cset -y 1 0x22 0x0d 0xff
echo "================"
i2cget -y 1 0x22 0x0d
i2cget -y 1 0x22 0x05
# Тест порта 10 закончено
echo "================="
echo "\033[37;1;41m OK \033[0m"
sleep 3
# Тест 11 порта
echo "\033[37;1;41m Проверка 11 порта \033[0m"
i2cset -y 1 0x22 0x0d 0xfd
i2cset -y 1 0x22 0x05 0xfe
echo "================"
i2cget -y 1 0x22 0x0d
i2cget -y 1 0x22 0x05
sleep 1
i2cset -y 1 0x22 0x05 0xff
i2cset -y 1 0x22 0x0d 0xff
echo "================"
i2cget -y 1 0x22 0x0d
i2cget -y 1 0x22 0x05
echo "\033[37;1;41m OK \033[0m"
echo "================"
# Тест порта 11 закончено
sleep 3
# Тест 15 порта
echo "\033[37;1;41m Проверка 15 порта \033[0m"
while true; do
    read -p "Нужно замкнуть 42 и 24 (должно быть 18)" yn
    case $yn in
        [Yy]* ) i2cget -y 1 0x22 0x01; break;;
        * ) echo "Нужно нажать на Y";;
    esac
done
sleep 1
while true; do
    read -p "Нужно разомкнуть 42 и 24 (должно быть 38)" yn
    case $yn in
        [Yy]* ) i2cget -y 1 0x22 0x01; break;;
        * ) echo "Нужно нажать на Y";;
    esac
done
echo "================"
# Тест порта 15 закончено
sleep 3
# Тест порта на звук
echo "\033[37;1;41m Тест порта на звук \033[0m"
i2cset -y 1 0x22 0x0d 0xfb
sleep 1
while true; do
    read -p "Нужно подсоединить порт 10 и 11 к наушникам" yn
    case $yn in
        [Yy]* ) aplay test.wav; break;;
        * ) echo "Нужно нажать на y";;
    esac
done
i2cset -y 1 0x22 0x0d 0xff
i2cget -y 1 0x22 0x0d
echo "================"
# Тест порта на звук закончено





