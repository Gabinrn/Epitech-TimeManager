defmodule App.Authentification.Auth do

  def init(default), do: default

  def get_role(conn) do
    case get_token(conn) do
      {:ok, token} ->
        case App.Token.verify_token(token) do
          {:ok, claims} -> claims["role"]
        end
    end
  end

  def get_userid(conn) do
    case get_token(conn) do
      {:ok, token} ->
        case App.Token.verify_token(token) do
          {:ok, claims} -> claims["user_id"]
        end
    end
  end

  def get_token(conn) do
    case Plug.Conn.get_req_header(conn, "bearer") do
      [auth_header] -> {:ok, auth_header}
      _ -> {:error, :missing_auth_header}
    end
  end

  def verify_token(claims) do
    {:ok, expire} = NaiveDateTime.from_iso8601(claims["expiry"])

    if NaiveDateTime.compare(expire, DateTime.utc_now()) == :gt do
      {:ok}
    else
      {:error}
    end
  end

  def unauthorized(conn) do
    conn |> Plug.Conn.send_resp(401, "Unauthorized") |> Plug.Conn.halt()
  end

  def authorized(conn, users) do
    conn
    |> Plug.Conn.assign(:signed_in, true)
    |> Plug.Conn.assign(:signed_user, users)
  end
end

defmodule App.Authentification.Verif do
  alias App.Authentification.Auth


  def init(default), do: default


  def call(conn, _default) do
    case Auth.get_token(conn) do
      {:ok, token} ->
        case App.Token.verify_token(token) do
          {:ok, claims} ->
            case Auth.verify_token(claims) do
              {:ok} -> Auth.authorized(conn, token)
              {:error} -> Auth.unauthorized(conn)
            end

          {:error, _default} ->
            Auth.unauthorized(conn)
        end

      _ ->
        Auth.unauthorized(conn)
    end
  end
end
