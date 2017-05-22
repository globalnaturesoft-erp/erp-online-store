module Erp
  module OnlineStore
    module Frontend
      class CategoryController < Erp::Frontend::FrontendController
        def index
          @body_class = "res layout-subpage"
          @menu = Erp::Menus::Menu.find(params[:menu_id])
          @related_menus = @menu.related_menus.limit(5)
          @products = @menu.get_products_for_categories(params).paginate(:page => params[:page], :per_page => 12)
          if Erp::Core.available?("banners")
            @hot_banners = Erp::Banners::Banner.get_category_banners
          end
          @meta_keywords = @menu.meta_keywords
          @meta_desciption = @menu.meta_description

          if request.xhr?
            render layout: nil
          end
        end

        def deal_products
          @products = Erp::Products::Product.get_deal_products.frontend_filter(params).paginate(:page => params[:page], :per_page => 16)
          @menus = Erp::Menus::Menu.get_menus
        end

        def bestseller_products
          @products = Erp::Products::Product.get_bestseller_products.frontend_filter(params).paginate(:page => params[:page], :per_page => 16)
          @menus = Erp::Menus::Menu.get_menus
        end

        def select2
          render json: {items: Erp::Menus::Menu.select2(params)}
        end
      end
    end
  end
end
