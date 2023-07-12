<%-- 
    Document   : toast
    Created on : Jun 18, 2023, 11:17:41 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                font-family: 'Jost', sans-serif;
            }
            
            #toast{
                display: flex;
                position: fixed;
                flex-direction: column;
                top:100px;
                right: 32px;
                z-index: 99999;
            }

            .toast2{
                display: flex;
                align-items: center;
                border-radius: 2px;
                border-left: 4px solid #000;
                padding: 8px 0;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
                min-width: 400px;
                max-width: 450px;
                transition: all ease .3s;
                background-color: #fff;
            }
            .toast2 + .toast2{
                margin-top: 8px;
            }
            .toast__icon{
                font-size: 24px;
                padding: 16px;
            }

            .toast__close{
                font-size: 24px;
                padding: 16px;
                color: rgba(0, 0, 0, 0.3);
                cursor: pointer;
            }
            .toast__close:hover{
                color: rgba(0, 0, 0, 0.6);
            }

            .toast__body{
                flex:1;
            }

            .toast__header{
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .toast__msg{
                font-size: 14px;
                color: #888;
                margin-top: 4px;
            }

            .toast--success{
                border-color: #47d664;
            }
            .toast--success .toast__icon{
                color: #47d664;
            }

            .toast--infor{
                border-color: #3086eb;
            }

            .toast--infor .toast__icon{
                color: #3086eb;
            }

            .toast--warning{
                border-color: #ffc122;
            }

            .toast--warning .toast__icon{
                color: #ffc122;
            }

            .toast--error{
                border-color: #ff623d;
            }

            .toast--error .toast__icon{
                color: #ff623d;
            }

            @keyframes slideIn{
                from{
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to{
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            @keyframes fadeOut{
                to{
                    opacity: 0;
                }
            }
            @media screen and (max-width:739px){
                #toast{
                    right: 10px;
                    
                }
                .toast2{
                    min-width: 100px;
                    max-width: 350px;
                    padding: 0;
                }
            }
        </style>
    </head>
    <body>
        <div id="toast">

    </div>
    <script defer>
        //Toast function
        function toast({
            title='',
            msg='',
            type='infor',
            duration=30000
        }){
            const main = document.getElementById('toast');
            if(main){
                const toast = document.createElement('div');
                const icons = ({
                    success:'fa-solid fa-circle-check',
                    infor:'fa-solid fa-circle-info',
                    warning:'fa-solid fa-circle-exclamation',
                    error:'fa-solid fa-circle-exclamation'
                });
                //auto remove toast
                const autoRemoveID = setTimeout(function(){
                    main.removeChild(toast);
                },duration+1000);
                //remove toast when click
                toast.onclick = function(e){
                    if(e.target.closest('.toast__close')){
                        main.removeChild(toast);
                        clearTimeout(autoRemoveID);
                    }
                };
                //get icon by type
                const icon = icons[type];
                const delay = (duration/1000).toFixed(2);// set time display toast
                toast.classList.add('toast2');
                toast.classList.add("toast--"+type);
                toast.style.animation = "slideIn cubic-bezier(0.47, 0, 0.745, 0.715) 0.65s, fadeOut linear 1s "+delay+"s forwards";
                toast.innerHTML = `
                    <div class="toast__icon">
                        <i class="`+icon+`"></i>
                    </div>
                    <div class="toast__body">
                        <h3 class="toast__header">`+title+`</h3>
                        <p class="toast__msg">`+msg+`</p>
                    </div>
                    <div class="toast__close">
                        <i class="fa-solid fa-xmark"></i>
                    </div>
                `;
                main.appendChild(toast);
            }
        }        
    </script>
    </body>
</html>
