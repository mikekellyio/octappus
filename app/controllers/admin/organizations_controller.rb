class Admin::OrganizationsController < ApplicationController
  before_action :set_admin_organization, only: [:show, :edit, :update, :destroy]

  # GET /admin/organizations
  def index
    @admin_organizations = Organization.all
  end

  # GET /admin/organizations/1
  def show
  end

  # GET /admin/organizations/new
  def new
    @admin_organization = Organization.new
  end

  # GET /admin/organizations/1/edit
  def edit
  end

  # POST /admin/organizations
  def create
    @admin_organization = Organization.new(admin_organization_params)

    if @admin_organization.save
      redirect_to [:admin, @admin_organization], notice: 'Organization was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/organizations/1
  def update
    if @admin_organization.update(admin_organization_params)
      redirect_to [:admin, @admin_organization], notice: 'Organization was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/organizations/1
  def destroy
    @admin_organization.destroy
    redirect_to admin_organizations_url, notice: 'Organization was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_organization
      @admin_organization = Organization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_organization_params
      params.require(:organization).permit(:name)
    end
end