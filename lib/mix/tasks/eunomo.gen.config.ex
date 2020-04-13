defmodule Mix.Tasks.Eunomo.Gen.Config do
  @moduledoc """
  Generates the default configuration for `Eunomo`.

  The `.eunomo.ex` file is created in the current working directory.
  """
  use Mix.Task

  @config_filename ".eunomo.exs"

  @impl true
  def run(_args) do
    create_config_file()
  end

  @spec create_config_file() :: :ok
  defp create_config_file do
    if File.exists?(@config_filename) do
      [:red, :bright, "File exists: #{@config_filename}, aborted."]
      |> IO.ANSI.format()
      |> IO.puts()
    else
      [:green, "* creating ", :reset, "#{@config_filename}"]
      |> IO.ANSI.format()
      |> IO.puts()

      File.write!(
        Path.join(File.cwd!(), @config_filename),
        """
        # Used by "mix eunomo"
        [
          inputs: :read_from_dot_formatter,
          formatter: [
            Eunomo.Formatter.AlphabeticalAliasSorter,
            Eunomo.Formatter.AlphabeticalImportSorter
          ]
        ]
        """
      )
    end
  end
end