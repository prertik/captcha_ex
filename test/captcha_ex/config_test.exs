defmodule CaptchaExConfigTest do
  use ExUnit.Case, async: true

  test "config can read regular config values" do
    Application.put_env(:captcha_ex, :test_var, "test")

    assert CaptchaEx.Config.get_env(:captcha_ex, :test_var) == "test"
  end

  test "config can read environment variables" do
    System.put_env("TEST_VAR", "test_env_vars")
    Application.put_env(:captcha_ex, :test_env_var, {:system, "TEST_VAR"})

    assert CaptchaEx.Config.get_env(:captcha_ex, :test_env_var) ==
             "test_env_vars"
  end
end
