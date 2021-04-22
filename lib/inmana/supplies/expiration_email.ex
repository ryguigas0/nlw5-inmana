defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "inmana@mailer.com",
      subject: "These items are expiring this week!",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "---------------- Supplies that are about to expire -------------------\n"

    Enum.reduce(supplies, initial_text, fn supply, text ->
      text <> supply_str(supply)
    end)
  end

  defp supply_str(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiring at: #{expiration_date}, Responsible: #{responsible}\n"
  end
end
