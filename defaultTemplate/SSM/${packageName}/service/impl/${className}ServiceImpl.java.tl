package ${data.packageName}.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ${data.packageName}.dao.${data.className}DAO;
import ${data.packageName}.dto.${data.className}DTO;
import ${data.packageName}.service.${data.className}Service;

/**
 * 类描述:     [${data.describe}业务接口实现类]
 * 创建人:     [${data.author}]
 * 创建时间:   [${date(),"yyyy-MM-dd HH:mm:ss"}]
 * 版本:       [v1.0]
 */
\@Service("${data.lowerClassName}Service")
public class ${data.className}ServiceImpl implements ${data.className}Service {


	\@Resource
	private ${data.className}DAO ${data.lowerClassName}DAO;

	/**
	 * 根据ID获取${data.describe}
	 */
	public ${data.className}DTO get${data.className}ById(long id) {
		return ${data.lowerClassName}DAO.get${data.className}ById(id);
	}

	/**
	 * 根据条件获取${data.describe}列表
	 */
	public List<${data.className}DTO> get${data.className}List(Map condition) {
		return ${data.lowerClassName}DAO.get${data.className}List(condition);
	}

	/**
	 * 获取${data.describe}的列表总数
	 */
	public long get${data.className}ListCount(Map condition) {
		return ${data.lowerClassName}DAO.get${data.className}ListCount(condition);
	}

	/**
	 * 新增${data.describe}
	 */
	public long add${data.className}(${data.className}DTO ${data.lowerClassName}DTO) {
		${data.lowerClassName}DAO.add${data.className}(${data.lowerClassName}DTO);
		return ${data.lowerClassName}DTO.getPatientId();
	}

	/**
	 * 更新${data.describe}
	 */
	public long update${data.className}(${data.className}DTO ${data.lowerClassName}DTO) throws Exception {
	@if(data.tableInfo.useLock){
	    //启用乐观锁
        int newVersion = ${data.lowerClassName}DTO.get${data.tableInfo.upperLockFiledProperty}() + 1;
		${data.lowerClassName}DTO.set${data.tableInfo.upperLockFiledProperty}(newVersion);
		${data.className}DTO db${data.className} = ${data.lowerClassName}DAO.get${data.className}ById(${data.lowerClassName}DTO.getId());
		if(db${data.className}.get${data.tableInfo.upperLockFiledProperty}() >= newVersion){
			throw new RuntimeException("数据版本冲突,请获取最新数据再进行更新操作");
		}
	@}
		return ${data.lowerClassName}DAO.update${data.className}(${data.lowerClassName}DTO);
	}

	/**
	 * 删除${data.describe}
	 */
	public long delete${data.className}ById(long id) {
		return ${data.lowerClassName}DAO.delete${data.className}ById(id);
	}

	@if(data.tableInfo.logicDel){
    /**
     * 逻辑删除${data.describe}
     */
     public long logicDelete${data.className}ById(long id){
        return ${data.lowerClassName}DAO.logicDelete${data.className}ById(id);
     }
    @}

}
