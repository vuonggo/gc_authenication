icons_dir="assets/icons"
images_dir="assets/images"
currentPackage=`basename "$PWD"`
output="lib/generated_images.dart"
touch "$output"
echo -n > $output

if [ "$(ls -A $icons_dir)" ]; then
    echo "class Ic {" >> $output
    for entry in "$icons_dir"/*
        do
        fname=`basename $entry`
        name="${fname%%.*}"
        replacedStrikethrough="$name"
        lowercase=$(echo "$replacedStrikethrough" | awk '{print tolower($0)}')
        camelCase=$(echo "$lowercase" | perl -pe 's/_([a-z])/uc($1)/ge')
        echo "  static const $camelCase = 'packages/$currentPackage/$entry';" >> $output
    done
    echo "}
" >> $output
else
    echo ''
fi

if [ "$(ls -A $images_dir)" ]; then
    echo "class Img {" >> $output
    for entry in "$images_dir"/*
        do
        fname=`basename $entry`
        name="${fname%%.*}"
        replacedStrikethrough="$name"
        lowercase=$(echo "$replacedStrikethrough" | awk '{print tolower($0)}')
        camelCase=$(echo "$lowercase" | perl -pe 's/_([a-z])/uc($1)/ge')
        echo "  static const $camelCase = 'packages/$currentPackage/$entry';" >> $output
    done
    echo "}
" >> $output
else
    echo ''
fi

