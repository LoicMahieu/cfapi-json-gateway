/**
 *
 * @author iGLOO
 * @description
 * @output false
 *
 */
component {

  variables.logged = false;
  variables.authHeader = 'X-CF-AdminPassword';

  /**
   * @returnformat json
   */
  remote any function callAPI(
    required string apiComponent,
    required string apiMethod,
    required string apiArguments
  ) {

    _login();

    try {
      var args = deserializeJSON(apiArguments);
    } catch (any e) {
      return { "success" = false, "message" = "Invalid apiArguments" };
    }

    try {
      var cmp = _createAPIComponent(apiComponent);
    } catch (any e) {
      return { "success" = false, "message" = "Invalid component" };
    }

    try {
      var res = evaluate('cmp.#apiMethod#(argumentCollection = args)');
    } catch (any e) {
      return { "success" = false, "message" = e.message };
    }

    if (!isNull(res)) {
      return { "success" = true, "res" = res };
    } else {
      return { "success" = true };
    }
  }


  private any function _createAPIComponent(required string cmp) {
    return createObject('component', 'CFIDE.adminapi.#cmp#');
  }

  private void function _login() {
    if( variables.logged ) {
      return;
    }

    var api = _createAPIComponent('administrator');
    var headers = getHTTPRequestData().headers;

    if( structKeyExists(headers, variables.authHeader) ) {
      api.login(headers[variables.authHeader]);
      variables.logged = true;
    }
  }

}
