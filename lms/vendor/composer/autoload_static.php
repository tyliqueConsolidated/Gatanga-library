<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitd9ca1cfd2e1fe8041a1b6ad5022edd6b
{
    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Stripe\\' => 7,
        ),
        'P' => 
        array (
            'Picqer\\Barcode\\' => 15,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Stripe\\' => 
        array (
            0 => __DIR__ . '/..' . '/stripe/stripe-php/lib',
        ),
        'Picqer\\Barcode\\' => 
        array (
            0 => __DIR__ . '/..' . '/picqer/php-barcode-generator/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitd9ca1cfd2e1fe8041a1b6ad5022edd6b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitd9ca1cfd2e1fe8041a1b6ad5022edd6b::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitd9ca1cfd2e1fe8041a1b6ad5022edd6b::$classMap;

        }, null, ClassLoader::class);
    }
}