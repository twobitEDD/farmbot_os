defmodule FarmbotTelemetry.MixProject do
  use Mix.Project

  @version Path.join([__DIR__, "..", "VERSION"])
           |> File.read!()
           |> String.trim()
  @elixir_version Path.join([__DIR__, "..", "ELIXIR_VERSION"])
                  |> File.read!()
                  |> String.trim()

  def project do
    [
      app: :farmbot_telemetry,
      version: @version,
      elixir: @elixir_version,
      elixirc_options: [warnings_as_errors: true, ignore_module_conflict: true],
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        test: :test,
        coveralls: :test,
        "coveralls.circle": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/Farmbot/farmbot_os",
      homepage_url: "http://farmbot.io",
      docs: [
        logo: "../farmbot_os/priv/static/farmbot_logo.png",
        extras: Path.wildcard("../docs/**/*.md")
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FarmbotTelemetry.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:telemetry, "~> 0.4.1"},
      {:uuid, "~> 1.1"},
      {:excoveralls, "~> 0.10", only: [:test], targets: [:host]},
      {:dialyxir, "~> 1.0.0-rc.3",
       only: [:dev], targets: [:host], runtime: false},
      {:ex_doc, "~> 0.19", only: [:dev], targets: [:host], runtime: false}
    ]
  end
end
