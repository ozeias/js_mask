/*  JS Mask JavaScript framework, version 0.1
 *  (c) 2008 Ozéias Sant'ana <ozeias at iconcreative dot net> <oz.santana at gmail dot com>
 *
 *  JS Mask is freely distributable under the terms of an MIT-style license.
 *  For details, see the JS Mask web site: http://blog.iconcreative.net/
 *
 *  Based on: Xaprb.InputMask by Baron Schwartz <baron at xaprb dot com>
 *  Required: Prototype JavaScript framework, version 1.6.0.2
 *            LowPro 0.5
 *
 *--------------------------------------------------------------------------*/
 
JSMask = {};
JSMask.Version = '0.1';
JSMask.CompatibleWithPrototype = '1.6.0.2';

if (Prototype.Version.indexOf(JSMask.CompatibleWithPrototype) == 0 && console && console.warn)
  console.warn("This version of JS Mask is tested with Prototype " + JSMask.CompatibleWithPrototype + 
                  " it may not work as expected with this version (" + Prototype.Version + ")");
JSMask.Base = {
    masks: {
      date_iso: {
         format: '    -  -  ',
         regex:  /\d/
      },
      date_br: {
         format: '  /  /    ',
         regex:  /\d/
      },
      time: {
         format: '  :  :  ',
         regex:  /\d/
      },
      phone: {
         format: '(  )    -    ',
         regex:  /\d/
      },
      ssn: {
         format: '   -  -    ',
         regex:  /\d/
      },
      visa: {
         format: '    -    -    -    ',
         regex:  /\d/
      }
   },
   
   applyMask: function(el, event) {
      var match = /mask_(\w+)/.exec(el.className);
      if ( match.length == 2 && JSMask.Base.masks[match[1]] ) {
         var mask = JSMask.Base.masks[match[1]];
         var key  = JSMask.Base.getKey(event);

         if ( JSMask.Base.isPrintable(key) ) {
            var ch      = String.fromCharCode(key);
            var str     = el.value + ch;
            var pos     = str.length;
            if ( mask.regex.test(ch) && pos <= mask.format.length ) {
               if ( mask.format.charAt(pos - 1) != ' ' ) {
                  str = el.value + mask.format.charAt(pos - 1) + ch;
               }
               el.value = str;
            }
            Event.stop(event);
         }
      }
   },

   isPrintable: function(key) {
      return ( key >= 32 && key < 127 );
   },

   getKey: function(e) {
      return window.event ? window.event.keyCode
           : e            ? e.which
           :                0;
   }
}

JSMask.Run = Behavior.create(Remote.Base, {
  onkeypress: function(event) {
    JSMask.Base.applyMask(this.element, event);
  }
});