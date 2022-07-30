<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 */

// ** MySQL settings ** //

/** The name of the database for WordPress */
define( 'DB_NAME', '${WP_DB}' );

/** MySQL database username */
define( 'DB_USER', '${WP_USER}' );

/** MySQL database password */
define( 'DB_PASSWORD', '${WP_PASSWORD}' );

/** MySQL hostname */
define( 'DB_HOST', '${WP_HOST}' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD','direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rv|#owJ|O4]jh!@5_l+1@K{w>MlV~[1>Id17DyiA&/]2N/R+;D#VVqARprPSIh}h');
define('SECURE_AUTH_KEY',  'NEX~GIqE+y,Fw3?.n8T-,GwI)C6!;@xDh+E:-@Bf]z.p`]QN?ld.{wlz+h^qA3ho');
define('LOGGED_IN_KEY',    'S~Lj&7+OLjN|K3Lx<ky5Z(l;i3/ZpjbZn =]9wLacp@F]K[7 wH<0MaZ-CXxh`?G');
define('NONCE_KEY',        'K%~Y9a@uzY}D}uF<K5Zr!3+k,NGNt3M3M#gQrK2vY)0CUmYs{On&Vl<<5LH}O[ML');
define('AUTH_SALT',        '+n>s&X6/4*/&%8nh;vv+E9Q;b{]qi*w}}:3DO`#2o#w1^^rcX0#)#9CdJ[+N;*UW');
define('SECURE_AUTH_SALT', '+%glW]W|zX-$60tE#-liI.YbTe|1rY%ie#d37ut8Di-?D<LS9}p/Nok7`Acduo<(');
define('LOGGED_IN_SALT',   '<0Vs(Rsp.GMCp36M  >yfi(8Jz?>:o]F}-8h%+-B:ObhM^|p_k0^o-(/*S.<h=HE');
define('NONCE_SALT',       'S[v<y9|)S&zW0dG[eJl+(uIfdjl}hvgz=-64J2LwLFNE|x4UZs{uI){DQq:+XcSe');

define('WP_CACHE_KEY_SALT', 'nabentay.42.fr');

define('WP_CACHE', true);

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

define( 'WP_SITEURL', 'https://nabentay.42.fr/' );

define( 'FORCE_SSL_ADMIN', true );

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );