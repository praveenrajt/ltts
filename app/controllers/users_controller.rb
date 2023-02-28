class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET / 
    # list.html.erb
    def list
        @query = User.ransack(params[:q])
        @query.sorts = 'created_at desc' if @query.sorts.empty?
        @users = @query.result
    end

    # GET /users/:id
    # edit.html.erb
    def edit; end

    # PUT /users/:id
    # show.html.erb/edit.html.erb
    def update
        respond_to do |format|
            if @user.update(permit_params)
                flash[:notice] = "Update successfully"
                format.html {redirect_to root_path}
            else
                flash.now[:error] = "Unsuccessful to Update"
                format.html {render :edit}
            end
        end
    end

    # GET /users/
    # new.html.erb
    def new
        @user = User.new
     end

    # POST /users/
    # new.html.erb/list.html.erb
    def create
        @user = User.new(permit_params)
        respond_to do |format|
            if @user.save
                flash[:notice] = "Update successfully"
                format.html {redirect_to root_path}
            else
                flash.now[:error] = "Unsuccessful Create"
                format.html {render :new}
            end
        end
    end

    # DELETE /users/
    # list.html.erb
    def destroy
        @user.destroy
        flash[:notice] = "Destroy successfully"
        redirect_to root_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def permit_params
        params.require(:user).permit(:first_name, :last_name, :email, :active)
    end
end
