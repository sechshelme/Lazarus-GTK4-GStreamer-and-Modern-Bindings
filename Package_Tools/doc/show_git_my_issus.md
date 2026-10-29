# Issues auflisten

Achtung, die mir Curl geben nur die neusten Issues aus

## Github
```sh
gh search issues "author:sechshelme" -L 100
```
```sh
curl -s -H "User-Agent: Mozilla" "https://api.github.com/search/issues?q=author:sechshelme+type:issue" | jq -r '.items[] | "[\(.state)]\t#\(.number)\t\(.title)"'
```

## Gnome
```sh
curl -s "https://gitlab.gnome.org/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```

## Freedeskop
```sh
curl -s "https://gitlab.freedesktop.org/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```

## Lazarus
```sh
curl -s "https://gitlab.com/api/v4/issues?author_username=sechshelme&scope=all" | jq -r '.[] | "[\(.state)]\t#\(.iid)\t\(.title)"'
```



