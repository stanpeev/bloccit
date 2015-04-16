def paginate (datas, pageinfo)
  datas.limit(pageinfo["perpage"]).offset( pageinfo["perpage"]*(pageinfo["page"]-1) )
end


def will_paginate(datas)
  # maxPage = ((@page_info["max_item"]-1) / @page_info["perpage"]) + 1
  maxPage = (@page_info["max_item"]/(@page_info["perpage"]*1.0))
  maxPage = maxPage.ceil

  paginateHTML = ''

  if maxPage > 1
    
    ## previous process
    if @page_info["page"] == 1
      paginateHTML = '← Previous '
    else
      prenum = @page_info["page"] - 1
      paginateHTML = '<a href="?page='+ prenum.to_s + '">← Previous</a> '
    end
    
    ## page num process
    maxPage.times do |page_num|
      dis_page_num = page_num+1

      if dis_page_num == @page_info["page"]
        paginateHTML += dis_page_num.to_s + ' '
      else
        paginateHTML += '<a href="?page=' + dis_page_num.to_s + '">'+ dis_page_num.to_s + '</a> '  
      end
    end

    ## next process
    if @page_info["page"] == maxPage
      paginateHTML += 'Next →'
    else
      nextnum = @page_info["page"] + 1 
      paginateHTML += '<a href="?page='+ nextnum.to_s + '">Next →</a>'   
    end

  end
  paginateHTML.html_safe
end
