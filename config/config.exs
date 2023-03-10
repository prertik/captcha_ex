use Mix.Config

config :captcha_ex,
  verify_url: "https://www.google.com/recaptcha/api/siteverify",
  timeout: 5000,
  public_key: {:system, "RECAPTCHA_PUBLIC_KEY"},
  secret: {:system, "RECAPTCHA_PRIVATE_KEY"}

config :captcha_ex, :json_library, Jason

import_config "#{Mix.env()}.exs"
