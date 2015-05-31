class MenusController < ApplicationController
  before_action :authenticate!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    fecha_inicio = params[:desde].blank? ? Date.today.beginning_of_month : params[:desde].to_date
    fecha_fin = params[:hasta].blank? ? Date.today.end_of_month : params[:hasta].to_date
    @menus = Menu.where(fecha: fecha_inicio..fecha_fin).order('fecha ASC')
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    fecha = params[:fecha].to_date rescue Date.today
    @menu = Menu.new fecha: fecha
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path, notice: 'Menú creado exitosamente.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menus_path, notice: 'Menú modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def generar_envio
    @envio = Envio.new
  end

  def enviar
    @envio = Envio.new params[:envio]
    if @envio.valid?
      MenusMailer.enviar(@envio, current_usuario).deliver_now
      redirect_to menus_path, notice: "Los menús han sido enviados exitosamente al correo #{ @envio.email }"
    else
      render :generar_envio
    end
  end

  def imprimir
    @envio = Envio.new params[:envio]
    render :generar_envio and return unless @envio.valid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:nombre, :fecha, { platillo_ids: [] })
    end
end
