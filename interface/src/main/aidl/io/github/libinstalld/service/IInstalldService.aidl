package io.github.libinstalld.service;
import io.github.libinstalld.service.IInstalldScopeCallback;

interface IInstalldService {
    const int API = 100;

    const int FRAMEWORK_PRIVILEGE_ROOT = 0;
    const int FRAMEWORK_PRIVILEGE_CONTAINER = 1;
    const int FRAMEWORK_PRIVILEGE_APP = 2;
    const int FRAMEWORK_PRIVILEGE_EMBEDDED = 3;

    const String AUTHORITY_SUFFIX = ".InstalldService";
    const String SEND_BINDER = "SendBinder";

    // framework details
    int getAPIVersion() = 1;
    String getFrameworkName() = 2;
    String getFrameworkVersion() = 3;
    long getFrameworkVersionCode() = 4;
    int getFrameworkPrivilege() = 5;

    // scope utilities
    List<String> getScope() = 10;
    oneway void requestScope(String packageName, IInstalldScopeCallback callback) = 11;
    String removeScope(String packageName) = 12;

    // remote preference utilities
    Bundle requestRemotePreferences(String group) = 20;
    void updateRemotePreferences(String group, in Bundle diff) = 21;
    void deleteRemotePreferences(String group) = 22;

    // remote file utilities
    String[] listRemoteFiles() = 30;
    ParcelFileDescriptor openRemoteFile(String name) = 31;
    boolean deleteRemoteFile(String name) = 32;
}
