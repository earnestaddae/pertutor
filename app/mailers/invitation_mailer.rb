class InvitationMailer < ApplicationMailer

  def invite(invitation)
    @invitation = invitation

    make_bootstrap_mail(
      to: invitation.email,
      subject: "Invitation to join #{invitation.account.name.capitalize} on PerTutor"
    )
  end
end
