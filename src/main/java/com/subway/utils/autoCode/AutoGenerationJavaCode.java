package com.subway.utils.autoCode;

import com.subway.domain.dev.App;
import com.subway.tableColumnConfig.TableColumnConfig;
import com.subway.tableColumnConfig.TableColumnConfigService;
import com.subway.tableConfig.TableConfig;
import com.subway.utils.PropertyUtil;
import com.subway.utils.StringUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.Version;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.subway.utils.ConstantUtils.GEN_FILE_PATH;


/**
 * 自动生成代码
 */
@Slf4j
public class AutoGenerationJavaCode {
    private String url;
    private String name;
    private String passWord;
    private String driver;
    private String sql;
    private String tableName;
    private String comment;
    private String templateDir;
    private String autoGeneratedFile;
    private String packageName;


    @Autowired
    TableColumnConfigService tableColumnConfigService;


    private static List<com.subway.template.Template> templateList = new ArrayList();

    static {


        templateList.add(new com.subway.template.Template("Template.ftl", ".java", GEN_FILE_PATH + "src/main/java/com/subway/"));
        templateList.add(new com.subway.template.Template("serviceTemplate.ftl", "Service.java", GEN_FILE_PATH + "src/main/java/com/subway/"));
        templateList.add(new com.subway.template.Template("searchServiceTemplate.ftl", "SearchService.java", GEN_FILE_PATH + "src/main/java/com/subway/"));
        templateList.add(new com.subway.template.Template("repositoryTemplate.ftl", "Repository.java", GEN_FILE_PATH + "src/main/java/com/subway/"));
        templateList.add(new com.subway.template.Template("controllerTemplate.ftl", "Controller.java", GEN_FILE_PATH + "src/main/java/com/subway/"));
        templateList.add(new com.subway.template.Template("jsTemplate.ftl", ".js", GEN_FILE_PATH + "src/main/webapp/js/app/"));
        templateList.add(new com.subway.template.Template("listTemplate.ftl", "list.jsp", GEN_FILE_PATH + "src/main/webapp/WEB-INF/pages/"));
        templateList.add(new com.subway.template.Template("tableListTemplate.ftl", "tableList.jsp", GEN_FILE_PATH + "src/main/webapp/WEB-INF/pages/"));
        templateList.add(new com.subway.template.Template("formTemplate.ftl", "form.jsp", GEN_FILE_PATH + "src/main/webapp/WEB-INF/pages/"));

    }
    /**
     * @param app
     * @param templateDir
     * @param autoGeneratedFile
     */
    public AutoGenerationJavaCode(App app, String templateDir, String autoGeneratedFile) {

        String tableName = app.getTableConfig().getTableName();
        this.url = PropertyUtil.getProperty("db.url");
        this.name = PropertyUtil.getProperty("db.username");
        this.passWord = PropertyUtil.getProperty("db.password");
        this.driver = PropertyUtil.getProperty("db.driver");
        this.sql = "select * from " + app.getTableConfig().getTableName();
        this.tableName = tableName;
        this.comment = app.getTableConfig().getTableDesc();
        this.templateDir = templateDir;
        this.autoGeneratedFile = autoGeneratedFile;
        this.packageName = app.getTableConfig().getDomainName();
    }


    /**
     * @throws IOException
     * @throws TemplateException
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void genCode(App app, List<TableColumnConfig> tableColumnConfigList) throws IOException, TemplateException, ClassNotFoundException,
            SQLException {
        Configuration cfg = new Configuration(new Version("2.3.27-incubating"));
        cfg.setDefaultEncoding("UTF-8");

        TableConfig tableConfig = app.getTableConfig();
        String className = tableConfig.getShortName();
        String tableName = tableConfig.getTableName();
        String comment = tableConfig.getTableDesc();
        String subDirName = StringUtils.lowerCaseCamel(className);
        //设置模板文件路径
        cfg.setDirectoryForTemplateLoading(new File(templateDir));
        Map<String, Object> rootMap = new HashMap<>();
        rootMap.put("subDirName", subDirName);
        rootMap.put("comment", comment);
        rootMap.put("tableName", tableName);
        rootMap.put("className", className);
        rootMap.put("columns", tableColumnConfigList);


        for (com.subway.template.Template template : templateList) {
            Template temp = cfg.getTemplate(template.getTemplateName(), "UTF-8");
            String path = template.getFileUrl() + "/" + subDirName + "/";
            File dir = new File(path);
            //检查目录是否存在，不存在则创建
            if (!dir.exists()) {
                dir.mkdir();
            }
            String filePath = "";
            if (template.getFileName().endsWith(".java")) {
                filePath = template.getFileUrl() + subDirName + "/" + className + template.getFileName();
            } else if (template.getFileName().endsWith(".js")) {
                filePath = template.getFileUrl() + subDirName + "/" + subDirName + template.getFileName();
            } else if (template.getFileName().equals("list.jsp")) {
                filePath = template.getFileUrl() + subDirName + "/" + "list.jsp";
            } else if (template.getFileName().equals("tableList.jsp")) {
                filePath = template.getFileUrl() + subDirName + "/" + "tableList.jsp";
            } else if (template.getFileName().equals("form.jsp")) {
                filePath = template.getFileUrl() + subDirName + "/" + "form.jsp";
            }
            log.info("filePath---------------" + filePath);
            File docFile = new File(filePath);
            if (!docFile.exists()) {
                Writer docOut = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile), "UTF-8"));// 完美解决乱码
                temp.process(rootMap, docOut);
                log.info("文件" + docFile + "不存在，已经重新生成");
            }


        }
    }

    /**
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    //获取数据库表字段名放入map中
    public Map<String, Object> getColumn() throws ClassNotFoundException, SQLException {
        Connection conn;
        PreparedStatement pStemt = null;
        Class.forName(driver);
        conn = DriverManager.getConnection(url, name, passWord);
        pStemt = conn.prepareStatement(sql);
        ResultSetMetaData rsmd = pStemt.getMetaData();
        Map<String, Object> columnMap = new HashMap<>();
        int size = rsmd.getColumnCount();
        for (int i = 0; i < size; i++) {
            String columnName = StringUtils.dealColumnName(rsmd, i);
            columnMap.put(columnName, columnName);
        }
        conn.close();
        return columnMap;
    }
}
