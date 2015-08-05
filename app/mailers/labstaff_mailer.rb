class LabstaffMailer < ApplicationMailer
  def experiment_email(user, proposal, experiment)
    @user = user
    @proposal = proposal
    @experiment = experiment
    @experiment_url = experiment_path(experiment)
    @proposal_url = proposal_path(proposal)
    mail(to: @user.email, subject: "This is a test!")
  end
end
