defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{GetByExpiration, ExpirationEmail}

  def send do
    data = GetByExpiration.call()

    # Notifies the email concurrently
    data
    |> Task.async_stream(fn {to_email, supplies} -> notify_email_task(to_email, supplies) end)
    |> Stream.run()
  end

  defp notify_email_task(to_email, supplies) do
    to_email |> ExpirationEmail.create(supplies) |> Mailer.deliver_later!()
  end
end
