/**********************************************************************
 * 
 * Code generated automatically by DirectJNgine
 * Copyright (c) 2009, Pedro Agulló Soliveres
 * 
 * DO NOT MODIFY MANUALLY!!
 * 
 **********************************************************************/

Ext.namespace( 'Ext.app');

Ext.app.PROVIDER_BASE_URL=window.location.protocol + '//' + window.location.host + '/' + (window.location.pathname.split('/').length>2 ? window.location.pathname.split('/')[1]+ '/' : '')  + 'djn/directprovider';

Ext.app.POLLING_URLS = {
}

Ext.app.REMOTING_API = {
  url: Ext.app.PROVIDER_BASE_URL,
  type: 'remoting',
  actions: {
    User: [
      {
        name: 'doLogout'/*() => bol.util.Response$ResponseMessage */,
        len: 0,
        formHandler: false
      },
      {
        name: 'doLogin'/*() => bol.util.Response$ResponseMessage -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'userTypes'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'getLoggedInUser'/*() => bol.modules.User */,
        len: 0,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    EmployeeQualification: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'qualificationLevels'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    EmployeeSection: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    EmployeePhoneNumber: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    SessionLog: [
      {
        name: 'getCurrentLog'/*() => bol.modules.SessionLog */,
        len: 0,
        formHandler: false
      },
      {
        name: 'list'/*(int, int, String, String, int) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      }
    ],
    Module: [
      {
        name: 'getModuleList'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'getSimpleList'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    Employee: [
      {
        name: 'stateTypes'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'employeeTypes'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    AccessGroup: [
      {
        name: 'commandTypes'/*() => java.util.List */,
        len: 0,
        formHandler: false
      },
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    Section: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'loadModule'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    Category: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'getTree'/*(String) => java.util.ArrayList */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'getMenu'/*(int) => java.util.ArrayList */,
        len: 1,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      },
      {
        name: 'categoryTypes'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      }
    ],
    EmployeeLicense: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'licenseTypes'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    TrainingCourse: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    TrainingModule: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'saveData'/*(com.google.gson.JsonArray) => bol.util.Response$ResponseMessage */,
        len: 1,
        formHandler: false
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ],
    Department: [
      {
        name: 'remove'/*(int) => void */,
        len: 1,
        formHandler: false
      },
      {
        name: 'commit'/*() => bol.util.Response$ResponseSubmission -- FORM HANDLER */,
        len: 1,
        formHandler: true
      },
      {
        name: 'list'/*() => java.util.ArrayList */,
        len: 0,
        formHandler: false
      },
      {
        name: 'pagination'/*(int, int, String, String, String) => bol.util.Response$ResponseList */,
        len: 5,
        formHandler: false
      },
      {
        name: 'create'/*(int) => bol.util.Response$ResponseObject */,
        len: 1,
        formHandler: false
      }
    ]
  }
}

