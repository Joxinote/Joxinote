<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="{{keywords}}">
    <meta name="description" content="{{description}}">
    <title>{{title}}</title>
    <link rel="stylesheet" href="{{DIR}}/theme/main.css" />
    <link rel="shortcut icon" href="/favicon.png" />
    <script src="/javascript/JQuery.js"></script>
    <script src="/javascript/JQuery.color.js"></script>
    <script src="/javascript/Base64.js"></script>
    <script src="/javascript/source.js"></script>
    <script src="/javascript/ckeditor/ckeditor.js"></script>
    <script language="JavaScript" type="text/javascript">
        var oauthdata = 0;
        {{SCRIPT}}
    </script>
    <script src="{{DIR}}/script/local.js"></script>
</head>
<body>
    <div class="error-layout">
        <div class="error-text">
            {{:error_happened}}.
        </div>
    </div>
    <div class="loading-layout">
        <img src="/public/images/loading.gif" class="loading-image" />
    </div>
    <div class="hidden-layout">
        <div class="opacity-layout" onclick="hideLayout();"></div>
        <table class="fullscreen">
            <tr>
                <td>
                    <div class="auth-window">
                        <div class="auth-window-title">
                            {{:authorization}}

                            <div class="auth-window-controls">
                                <a href="#" onclick="closeAuthWindow();"><img src="{{DIR}}/theme/icons/close.png" /></a>
                            </div>
                        </div>

                        <div class="auth-window-content">
                            <table class="auth-window-content-table">
                                <tr class="auth-window-content-tr">
                                    <td class="auth-window-content-td auth-window-content-td-left">
                                        <input type="text" id="auth-form-login" placeholder="{{:enter_login}}.." />
                                        <br />
                                        <input type="password" id="auth-form-password" placeholder="{{:enter_password}}.." />
                                        <br />
                                        <input type="text" maxlength="5" id="auth-form-captcha" placeholder="{{:captcha}}.." />
                                        <img class="captcha" onclick="updateCaptcha('.auth-window');" src="/public/captcha.php?" id="auth-form-captcha-img" />
                                    </td>
                                    <td class="auth-window-content-td auth-window-content-td-left">
                                        <a onclick="void(0);" href="https://oauth.vk.com/authorize?client_id={{VK_APP_ID}}&scope=email&redirect_uri=http://{{HTTP_HOST}}/oauth/vk/&response_type=code&v=5.14">
                                            <img src="{{DIR}}/theme/icons/vk-login.png" class="login-enter-img" />
                                        </a>
                                        <br />
                                        <a onclick="void(0);" href="https://accounts.google.com/o/oauth2/auth?redirect_uri=http%3A%2F%2F{{HTTP_HOST}}%2Foauth%2Fgoogle&response_type=code&client_id={{GOOGLE_CLIENT_ID}}&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile">
                                            <img src="{{DIR}}/theme/icons/google-login.png" class="login-enter-img" />
                                        </a>
                                    </td>
                                </tr>
                                <tr class="auth-window-content-tr auth-window-buttons">
                                    <td class="auth-window-content-td auth-window-buttons" colspan="2">
                                        <button onclick="processAuthorizing();">{{:enter}}</button>
                                        <div class="auth-form-forgot-password">
                                            <a href="/forgot-password/">{{:forgot_password}}</a><br /><a href="#" onclick="closeAuthWindow(); openRegWindow();">{{:registration}}</a>
                                        </div>
                                        <div class="auth-form-hint">
                                            {{:captcha_hint}}
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!--                       Регистрация                         -->

                    <div class="reg-window">
                        <div class="reg-window-title">
                            {{:registration}}

                            <div class="reg-window-controls">
                                <a href="#" onclick="closeRegWindow();"><img src="{{DIR}}/theme/icons/close.png" /></a>
                            </div>
                        </div>

                        <div class="reg-window-content">
                            <table class="reg-window-content-table">
                                <tr class="reg-window-content-tr">
                                    <td class="reg-window-content-td reg-window-content-td-left">
                                        <input type="text" name="logim" id="reg-form-login" placeholder="{{:choose_login}}.." />
                                        <br />
                                        <input type="password" id="reg-form-password" placeholder="{{:enter_password}}.." />
                                        <br />
                                        <input type="password" id="reg-form-password-repeat" placeholder="{{:repeat_password}}.." />
                                        <br />
                                        <input type="text" name="email" id="reg-form-email" placeholder="{{:your_email}}.." />
                                        <br />
                                        <input type="text" id="reg-form-name" placeholder="{{:your_name}}.." />
                                        <br />
                                        <input type="text" maxlength="5" id="reg-form-captcha" placeholder="{{:captcha}}.." />
                                        <img class="captcha" onclick="updateCaptcha('.reg-window');" src="/public/captcha.php?" id="reg-form-captcha-img" />
                                    </td>
                                    <td class="reg-window-content-td reg-window-content-td-left">
                                        <a onclick="void(0);" href="https://oauth.vk.com/authorize?client_id={{VK_APP_ID}}&scope=email&redirect_uri=http://{{HTTP_HOST}}/oauth/vk/&response_type=code&v=5.14">
                                            <img src="{{DIR}}/theme/icons/vk-login.png" class="login-enter-img" />
                                        </a>
                                        <br />
                                        <a onclick="void(0);" href="https://accounts.google.com/o/oauth2/auth?redirect_uri=http%3A%2F%2F{{HTTP_HOST}}%2Foauth%2Fgoogle&response_type=code&client_id={{GOOGLE_CLIENT_ID}}&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile">
                                            <img src="{{DIR}}/theme/icons/google-login.png" class="login-enter-img" />
                                        </a>
                                    </td>
                                </tr>
                                <tr class="reg-window-content-tr reg-window-buttons">
                                    <td class="reg-window-content-td reg-window-buttons" colspan="2">
                                        <button onclick="processRegister();">{{:register}}</button>
                                        <div class="reg-form-hint">
                                            {{:captcha_hint}}
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>