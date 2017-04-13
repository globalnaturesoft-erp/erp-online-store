module Erp
  module OnlineStore
    module Frontend
      class BrandController < Erp::Frontend::FrontendController
        include Erp::ApplicationHelper
        include Erp::OnlineStore::ApplicationHelper
        
        def listing
          @body_class = "res layout-subpage"
          @brands = Erp::Products::Brand.get_brands
        end
        
        def detail
        end
      end
    end
  end
end
