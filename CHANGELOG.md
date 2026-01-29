# Changelog
Following Semantic Versioning 2.

## next version:


## Version 0.7.0 (MINOR)
- Refactor to use Decidim::Valid namespace.
- Add pending views and translations.
- Verify the user with a :valid Authorization after successful registration.
- Upgrade to omniauth-idcat_mobil 0.6.0 to fix bug when Decidim does slice on the AuthHash.
- Added optional VERIFICATION_EXPIRATION_TIME env var.

## Version 0.6.0 (MINOR)
- Upgrade Decidim version to 0.29
- Bump Ruby version to 3.2.9

## Version 0.5.0 (MINOR)
- Upgrade Decidim version to 0.28
- Bump Ruby version to 3.1.1

## Version 0.4.0 (MINOR)
- DOC: Define the correct icon_path configuration value in README
- Bump Ruby version to 3.0.7

## Version 0.3.0 (MINOR)
- Update omniauth-idcat_mobil: Send the client_id and the client_secret during the AuthToken retrieval.
- Bump Ruby version to 2.7.7.

## Version 0.2.1 (PATCH)
- Expose IdCat mòbil icon via webpacker (the icon has been renamed to avoid conflicts so it should be changed in the apps, see new name in Usage/omniauth-idcat_mobil configuration in the README)

## Version 0.2.0 (MINOR)
- Update gems with security patches
- Update `decidim-idcat_mobil` to depend upon `omniauth` "~> 2.0.4"

## Version 0.1.0 (MINOR)
- CI: Introduce continuous integration via GitHub Actions.
- CI: Apply `rubocop` recommendations.
- Force minimum `omniauth-idcat_mobil` to v0.3.0.

## Version 0.0.9 (PATCH)
- Force minimum `omniauth-idcat_mobil` to v0.2.4.

## Version 0.0.8 (PATCH)
- Force minimum `omniauth-idcat_mobil` to v0.2.3.
- Add `.ruby-version` file

## Version 0.0.7 (PATCH)
- Force minimum `omniauth-idcat_mobil` to v0.2.2.
- Bump Ruby version to 2.7.2.

## Version 0.0.6 (MINOR)

- Make gem compatible with Decidim v0.23.
- DOC: Explain that verification is uncomplete.
- Do not force `byebug` version.
- Force English locale when executing tests.
- Update literals in tests.
- Add `.byebug_history` file to `.gitignore`.
- Make module compatible with Decidim's per organization configuration.

## Version 0.0.5 (MINOR)
- Make gem compatible with Decidim v0.20 (tested against decidim v0.21)
- Remove initializer to force `Decidim::CurrentOrganization` to be executed before `Warden::Manager`. It is already done in Decidim since v0.16

## Version 0.0.4 (PATCH)
- Remove Gemfile.lock to avoid problems with apps using this gem and solving devise vulneravility: https://github.com/plataformatec/devise/issues/4981.

## Version 0.0.3 (PATCH)
- Copied icon from omniauth-idcat_mobil to be used since decidim v0.16.0.

## Version 0.0.2 (PATCH)
- [FIX] Require omniauth-idcat_mobil before actual egine.
- [REFACTOR] Remove dependency declaration from omniauth-idcat_mobil from Gemfile, already setted in gemspec file.

## Version 0.0.1 (PATCH)
- First release.
