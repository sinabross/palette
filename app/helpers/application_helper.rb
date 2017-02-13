module ApplicationHelper
    
    def devise_flash
      if controller.devise_controller? && resource.errors.any?
        flash.now[:error] = flash[:error].to_a.concat resource.errors.full_messages
        flash.now[:error].uniq!
      end
    end

    # Paging helper
    def getTotalPageList( total_cnt, rowsPerPage )
        if ((total_cnt % rowsPerPage) == 0)
            total_pages = total_cnt / rowsPerPage;
        else
            total_pages = (total_cnt / rowsPerPage) + 1;
        end

        totalPageList = (1..total_pages).to_a
        #totalPageList = Array (1..total_pages)
    end
    
end
