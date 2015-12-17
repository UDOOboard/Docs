#/bin/sh

php generate.php global.json out


#Fix for floating code, something we don't want
echo "{\"float\": false}" > out/config.json
