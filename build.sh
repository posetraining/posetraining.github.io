cp ~/Dropbox/Apps/Slides\ App/open-source-ecosystems-a24bfb.html .
cp -r ~/Dropbox/Apps/Slides\ App/open-source-ecosystems-a24bfb .
cp -r ~/Dropbox/Apps/Slides\ App/lib .
mv open-source-ecosystems-a24bfb.html index.html

function escape_slashes {
    sed 's/\//\\\//g'
}

function change_line {
    local OLD_LINE_PATTERN=$1; shift
    local NEW_LINE=$1; shift
    local FILE=$1

    local NEW=$(echo "${NEW_LINE}" | escape_slashes)
    sed -i .bak '/'"${OLD_LINE_PATTERN}"'/s/.*/'"${NEW}"'/' "${FILE}"
    mv "${FILE}.bak" /tmp/
}


change_line "controls: true," "controls: false," index.html
change_line "deck: Slides" "<title>Open Source Ecoss</title>" index.html
sed 's/.*controls: true*/controls: false/' index.html
git add .
git ci -m "EOS CI"
git push
