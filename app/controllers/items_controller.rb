class ItemsController < ApplicationController
     before_action :authenticate_user!
     def index
      @items=Item.all
      @carts = current_user.carts #TO RENDER ALL THE ITEMS IN CART FOR CURRENT_USER 
    end
    def show
    @item=Item.find(params[:id])
    end
    def new 
    @item=Item.new 
    end 
    def create 
        @item=Item.create(item_params)
        redirect_to root_path(@item)
     end 
     def destroy 
       @item= Item.find(params[:id])
       redirect_to root_path
     end
    
    def edit
    @item = Item.find(params[:id])
    end
    def update
     @item = Item.find(params[:id])
     @item.update(item_params)
     redirect_to item_path(@item)
    end
    private
     def item_params
      params.require(:item).permit(:name, :image,:price)
    end
  

end
