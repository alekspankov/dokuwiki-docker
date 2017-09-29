# DokuWiki 

[Doku Wiki](https://www.dokuwiki.org/) on top of [PHP 7.0 with Apache](https://hub.docker.com/_/php/). 

## CHANGELOG

- 09/29/2017  Updated Dokuwiki to version 2017-02-19e 

## Getting Started

1. Pull image ```docker pull aleksxp/dokuwiki```
1. Run ```docker run -d --name some-doku -p 8080:80 aleksxp/dokuwiki```

Read more about **docker run** option in [official Docker documentstion](https://docs.docker.com/engine/reference/run/).

## Build
1. Create directory
1. CD into created directory
1. Create Dockerfile. Use ```FROM aleksxp/dokuwiki```. Add whatever you need. 
1. Run ```docker build -t your_image_name .```

Read more about **Dockerfile** and **docker build** in  [official Docker documentstion](https://docs.docker.com/engine/reference/builder/).

### Prerequisites

1. [Docker](https://docs.docker.com/engine/installation/)


## Authors

* **Alexander Pankov** <ap@wdevs.ru>

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details