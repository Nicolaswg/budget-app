class AgreementsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @group_transaction = GroupAgreement.includes(:agreement).where(group_id: params[:group_id]).order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @list_group = current_user.groups
  end

  def create
    if check_categorie
      agreement = current_user.agreements.new(name: params[:name], amount: params[:amount])

      if agreement.save
        select_groups_id.each do |id|
          group_agreements = GroupAgreement.new(agreement_id: agreement.id, group_id: id)
          unless group_agreements.save
            redirect_to new_group_agreement_path
            flash[:error] = 'Transaction wasn\'t added'
          end
        end
        redirect_to group_agreements_path
        flash[:success] = 'Transaction added'
      else
        redirect_to new_group_agreement_path
        flash[:error] = 'Transaction needs a name and ammount'
      end
    else
      redirect_to new_group_agreement_path
      flash[:error] = 'Select a categorie'
    end
  end

  private

  def check_categorie
    return false if select_groups_id.nil?

    true
  end

  def select_groups_id
    params[:groups]
  end
end
