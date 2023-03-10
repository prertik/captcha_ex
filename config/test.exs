use Mix.Config

config :captcha_ex,
  http_client: CaptchaEx.Http.MockClient,
  secret: "test_secret",
  public_key: "test_public_key"
