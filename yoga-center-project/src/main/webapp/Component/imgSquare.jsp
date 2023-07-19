<%-- 
    Document   : imgSquare
    Created on : Jul 13, 2023, 10:08:01 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script defer>
    //to use this  need set img-square-container for class contain img, set max-with for container
    window.addEventListener('DOMContentLoaded', function() {
                var container = document.querySelectorAll('.img-square-container');
                container.forEach(c =>{
                    var image = c.querySelector('img');
                    let width = $(c).css('max-width');
                    $(c).css({
                        display: 'flex',
                        justifyContent: 'center',
                        alignItems: 'center',
                        overflow: 'hidden'
                     });
                    
                    if (image.naturalWidth > image.naturalHeight) {
                      image.style.width = 'auto';
                      image.style.height = width;
                    } else {
                      image.style.width = width;
                      image.style.height = 'auto';
                    }
                });
              });
</script>
