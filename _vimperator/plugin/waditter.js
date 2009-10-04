// Vimperator plugin: "waditter"
//
// Commands:
//  :waditter
//      show wady's tweets

(function(){
    var evalFunc = window.eval;
    try {
        var sandbox = new Components.utils.Sandbox(window);
        if (Components.utils.evalInSandbox("true", sandbox) === true){
            evalFunc = function(text){
                return Components.utils.evalInSandbox(text, sandbox);
            };
        }
    } catch (e){ liberator.log("warning: twitter.js is working with unsafe sandbox."); }

    function showWadyStatus(){
        var xhr = new XMLHttpRequest();
        var endPoint = "http://labs.fujikkys.com/w/json";
        xhr.open("GET", endPoint, false);
        xhr.send(null);
        var statuses = evalFunc(xhr.responseText) || [];

        var html = <style type="text/css"><![CDATA[
            span.twitter.entry-content a { text-decoration: none; }
            img.twitter.photo { border; 0px; width: 16px; height: 16px; vertical-align: baseline; margin: 1px; }
        ]]></style>.toSource()
                   .replace(/(?:\r\n|[\r\n])[ \t]*/g, " ") +
            statuses.map(function(status)
                <>
                    <img src={status.user.profile_image_url}
                         alt={status.user.screen_name}
                         title={status.user.screen_name}
                         class="twitter photo"/>
                    <strong>{status.user.name}&#x202C;</strong>
                    : <span class="twitter entry-content">{status.text}</span>
                </>.toSource()
                   .replace(/(?:\r\n|[\r\n])[ \t]*/g, " "))
                        .join("<br/>");

        //liberator.log(html);
        liberator.echo(html, true);
    }
    liberator.modules.commands.addUserCommand(["waditter"], "show wady status",
        function(arg, special){
            showWadyStatus();
        },{
            bang: true,
            literal: 0
        }
    );
})();
// vim:sw=4 ts=4 et:
