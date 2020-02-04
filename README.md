# Git Hooks for PHP Projects 

## About

Auto installed git pre-commit hook for running [PHP Code Sniffer](https://github.com/squizlabs/PHP_CodeSniffer) 
code checking to PSR2 coding standard compliance and [PHPStan](https://github.com/phpstan/phpstan) to discover bugs on code. 

**It checks only files that are to be committed.**

Inspired by [Enforce code standards with composer, git hooks, and phpcs](http://tech.zumba.com/2014/04/14/control-code-quality/) and https://github.com/smgladkovskiy/phpcs-git-pre-commit and https://gist.github.com/BrizzleRocker/62ed61b37acf05344d4bce894e719251 . Installer checks OS on hosting machine and installs needed hooks for platform.

## Prerequisites

**Docker** & **Docker compose** the hooks execute checkings inside the php container

**.env** file in project root 

The hook uses default name "app" for the php container if you want to use other name add it to your .env file:

    
    SERVICE_PHP_NAME=app
    

## Installation

Add the repository to your composer:

    "repositories": [
            {
                "type": "vcs",
                "url": "https://github.com/the-cocktail/ie-eventos"
            }
        ],

Install `the-cocktail/php-git-hooks` with composer require command:

    composer require --dev "the-cocktail/php-git-hooks"

Or alternatively, include a dependency for `the-cocktail/php-git-hooks` in your composer.json file manually:

    {
        "require-dev": {
            "the-cocktail/php-git-hooks": "*"
        }
    }

To enable code sniff, аdd to `post-install-cmd` and `post-update-cmd` in `composer.json` installation script:

    "scripts": {
        "post-install-cmd": [
            "PHPCodeChecker\\Installer::postInstall"
        ],
        "post-update-cmd": [
            "PHPCodeChecker\\Installer::postInstall"
        ]
    }

Then run `composer install` or `composer update`. `pre-commit` hook will be installed or updated if it already exists.

Follow composer suggests to configure your development environment.

## Usage

Run `git commit` and pre-commit hook will check lint, PSR-2 coding standard compliance and phpstan if installed

You can commit without start docker containers; the hook detect it and ask if you want to commit without check the code.


