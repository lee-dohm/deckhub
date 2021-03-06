defmodule DeckhubWeb.PrimerHelpers do
  @moduledoc """
  View helper functions for generating elements that work with
  [GitHub's Primer](https://primer.github.io/) CSS framework.

  All functions can be used either within a template or composed together in code. Each function
  should always emit `t:Phoenix.HTML.safe/0` objects or throw an exception.
  """

  use Phoenix.HTML

  require DeckhubWeb.Gettext

  import DeckhubWeb.Gettext, only: [gettext: 1]

  @typedoc """
  The application name as an atom.
  """
  @type app_name :: atom

  defmodule MissingConfigurationError do
    @moduledoc """
    Exception raised when there is an element of required application configuration missing.
    """

    defexception [:missing_keys]

    def exception(key) when is_atom(key), do: exception([key])

    def exception(keys) when is_list(keys) do
      %__MODULE__{missing_keys: keys}
    end

    def message(%{missing_keys: missing_keys}) do
      "application configuration missing: #{inspect(missing_keys)}"
    end
  end

  @doc """
  Renders the GitHub-style `<> with ♥ by [author link]` footer item.

  Retrieves the author's name and URL from the application configuration for the default application
  for the current module. See `code_with_heart/2` for more information.
  """
  @spec code_with_heart() :: Phoenix.HTML.safe()
  def code_with_heart do
    code_with_heart(Application.get_application(__MODULE__))
  end

  @doc """
  Renders the GitHub-style `<> with ♥ by [author link]` footer item.

  Retrieves the author's name and URL from the application configuration before passing to
  `code_with_heart/3`. This information can be added to the application configuration by adding the
  following to your `config.exs`:

  ```
  config :app_name,
    code_with_heart: [
      name: "Author's name",
      url: "https://example.com"
    ]
  ```

  Raises a `DeckhubWeb.PrimerHelpers.MissingConfigurationError` if any of the required
  application configuration information is not specified and this function is called.

  If passed two strings instead of an atom and a keyword list, this function will assume that you
  mean to call `code_with_heart/3` with no options and do so for you.
  """
  @spec code_with_heart(atom, Keyword.t()) :: Phoenix.HTML.safe()
  def code_with_heart(app_name, options \\ [])

  def code_with_heart(app_name, options)

  def code_with_heart(app_name, options) when is_atom(app_name) and is_list(options) do
    config = Application.get_env(app_name, :code_with_heart)
    name = config[:name]
    url = config[:url]

    unless name && url, do: raise(MissingConfigurationError, :code_with_heart)

    code_with_heart(name, url, options)
  end

  def code_with_heart(name, url) when is_binary(name) and is_binary(url),
    do: code_with_heart(name, url, [])

  @doc """
  Renders the GitHub-style `<> with ♥ by [author link]` footer item.

  The text in this element is intentionally left untranslated because the form of the element is
  intended to be recognizable in its specific format.

  ## Options

  All options are passed to the underlying HTML `a` element.

  ## Examples

  ```
  Phoenix.HTML.safe_to_string(DeckhubWeb.PrimerHelpers.code_with_heart("Author's Name", "https://example.com"))
  #=> "<svg .../> with <svg .../> by <a href=\"https://example.com\">Author's Name</a>"
  ```
  """
  @spec code_with_heart(String.t(), String.t(), Keyword.t()) :: Phoenix.HTML.safe()
  def code_with_heart(name, url, options) do
    link_options = Keyword.merge([to: url, class: "link-gray-dark"], options)

    html_escape([
      PhoenixOcticons.octicon(:code),
      " with ",
      PhoenixOcticons.octicon(:heart),
      " by ",
      link(name, link_options)
    ])
  end

  @doc """
  Renders a link to the project on GitHub.

  Retrieves the project name or URL from the application configuration for the default application.
  """
  @spec github_link(Keyword.t()) :: Phoenix.HTML.safe()
  def github_link(options \\ [])

  def github_link(options), do: github_link(options, [])

  @doc """
  Renders a link to the project on GitHub.

  If the first parameter is an atom, it retrieves the project name or URL from the application
  configuration. Otherwise, the project can be either the GitHub `owner/project` identifier or the
  full GitHub URL.

  This configuration information can be added to the application configuration by adding the
  following to your `config.exs`:

  ```
  config :app_name,
    github_link: "owner/name"
  ```

  If the configuration information is missing and the first parameter is an atom, a
  `AtomTweaksWeb.PrimerHelpers.MissingConfigurationError` is raised.

  ## Options

  All options are passed to the underlying HTML `a` element.
  """
  @spec github_link(app_name | String.t(), Keyword.t()) :: Phoenix.HTML.safe()
  def github_link(app_name_or_project, options)

  def github_link(options, _no_options) when is_list(options) do
    github_link(Application.get_application(__MODULE__), options)
  end

  def github_link(app_name, options) when is_atom(app_name) do
    url = Application.get_env(app_name, :github_link)

    unless url, do: raise(MissingConfigurationError, :github_link)

    github_link(url, options)
  end

  def github_link(project, options) when is_binary(project) do
    # Prepend the `https://github.com/` if only the name with owner is specified
    url = if project =~ ~r{^[^/]+/[^/]+$}, do: "https://github.com/#{project}", else: project

    link_options =
      Keyword.merge(
        [
          to: url,
          "aria-label": gettext("View this project on GitHub"),
          class: "link-gray-dark tooltipped tooltipped-n"
        ],
        options
      )

    link(link_options) do
      PhoenixOcticons.octicon("mark-github")
    end
  end
end
