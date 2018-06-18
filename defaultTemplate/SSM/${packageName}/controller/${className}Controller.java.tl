package ${data.packageName}.controller;

import ${data.packageName}.dto.${data.className}DTO;
import ${data.packageName}.service.${data.className}Service;

import relaxingchu.pyh.cdtu.zh.HttpParameterMap;
import relaxingchu.pyh.cdtu.zh.HttpResponseFormat;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 类描述:     [${data.className}Controller]
 * 创建人:     [${data.author}]
 * 创建时间:   [${date(),"yyyy-MM-dd HH:mm:ss"}]
 */
\@Controller
\@RequestMapping("/${data.lowerClassName}")
public class ${data.className}Controller {
    \@Autowired
    private ${data.className}Service ${data.lowerClassName}Service;

    private HttpServletResponse response_globle = null;
    private ${data.className}DTO ${data.lowerClassName} = null;

    /**
	 * 查询${data.describe}列表
	 */
    \@RequestMapping("/list")
    public void ${data.lowerClassName}List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response_globle = HttpResponseFormat.httpResponseFormat(response); //将返回对象格式化
        Map<String, Object> condition = HttpParameterMap.getParameterMap(request);
        List<${data.className}DTO> list = ${data.lowerClassName}Service.get${data.className}List(condition);
        response_globle.getWriter().write(JSONArray.fromObject(list).toString());
    }

    /**
	 * 根据id查询${data.describe}
	 */
    \@RequestMapping("/selectById")
    public void get${data.className}ById(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response_globle = HttpResponseFormat.httpResponseFormat(response); //将返回对象格式化
        ${data.className}DTO ${data.lowerClassName}ById = ${data.lowerClassName}Service.get${data.className}ById(Integer.parseInt(request.getParameter("${data.lowerClassName}_id")));
        response_globle.getWriter().write(JSONArray.fromObject(${data.lowerClassName}ById).toString());
    }

    /**
	 * 根据id删除${data.describe}
	 */
    \@RequestMapping("/delById")
    public void delete${data.className}(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response_globle = HttpResponseFormat.httpResponseFormat(response); //将返回对象格式化
        long result = ${data.lowerClassName}Service.delete${data.className}ById(Integer.parseInt(request.getParameter("${data.lowerClassName}_id")));
        String status = result > 0 ? "[{status_delete: true}]" : "[{status_delete: false}]";
        response_globle.getWriter().write(JSONArray.fromObject(status).toString());
    }

    /**
	 * 新增${data.describe}
	 */
    \@RequestMapping("/add")
    public void add${data.className}(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response_globle = HttpResponseFormat.httpResponseFormat(response); //将返回对象格式化
    	${data.lowerClassName} = new ${data.className}DTO();

        long result = ${data.lowerClassName}Service.add${data.className}(${data.lowerClassName});
        String status = result > 0 ? "[{status_add: true}]" : "[{status_add: false}]";
        response_globle.getWriter().write(JSONArray.fromObject(status).toString());
    }

    /**
	 * 更新${data.describe}
	 */
    \@RequestMapping("/update")
    public void update${data.className}(HttpServletRequest request, HttpServletResponse response) throws Exception {
   		response_globle = HttpResponseFormat.httpResponseFormat(response); //将返回对象格式化
   		${data.lowerClassName} = new ${data.className}DTO();

        long result = ${data.lowerClassName}Service.update${data.className}(${data.lowerClassName});
        String status = result > 0 ? "[{status_update: true}]" : "[{status_update: false}]";
        response_globle.getWriter().write(JSONArray.fromObject(status).toString());
    }
}
