package kr.co.softsoldesk.config;
 
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.Interceptor.CheckWriterInterceptor;
import kr.co.softsoldesk.Interceptor.LoginInterceptor;
import kr.co.softsoldesk.Interceptor.PortfolioAlarmInterceptor;
import kr.co.softsoldesk.Interceptor.ReportAlarmInterceptor;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor2;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor3;
import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.AdminMapper;
import kr.co.softsoldesk.mapper.CalendarMapper;
import kr.co.softsoldesk.mapper.CareerMapper;
import kr.co.softsoldesk.mapper.ChatMapper;
import kr.co.softsoldesk.mapper.DetailCategoryMapper;
import kr.co.softsoldesk.mapper.EducationMapper;
import kr.co.softsoldesk.mapper.InterestMapper;
import kr.co.softsoldesk.mapper.PortFolioMapper;
import kr.co.softsoldesk.mapper.PostMapper;
import kr.co.softsoldesk.mapper.ProProfileMapper;
import kr.co.softsoldesk.mapper.ProUserMapper;
import kr.co.softsoldesk.mapper.ReviewMapper;
import kr.co.softsoldesk.mapper.ServiceCategoryMapper;
import kr.co.softsoldesk.mapper.UserMapper;
import kr.co.softsoldesk.service.AdminService;
import kr.co.softsoldesk.service.ChatService;
import kr.co.softsoldesk.service.PostService;

/*import kr.co.softsoldesk.Inteceptor.CheckLoginInterceptor;
import kr.co.softsoldesk.Inteceptor.TopMenuInteceptor;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.TopMenuMapper;
import kr.co.softsoldesk.mapper.UserMapper;
import kr.co.softsoldesk.service.TopMenuService;*/

@Configuration
@EnableWebMvc
@ComponentScan("kr.co.softsoldesk.controller")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.service") // dao와 service를 빈으로 등록
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {

	// 프로퍼티의 키를 활용해서 값 가져오기
	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean; 
	
	@Resource(name="loginProuserBean")
	private ProUserBean loginProuserBean; 
	
	@Resource(name="AdminloginBean")
	private AdminBean AdminloginBean;
	
	@Resource(name="AdminAlarm")
	public PortFolioBean AdminAlarm;
	
	@Resource(name="alarmReportBean")
	public ReportBean alarmReportBean;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private AdminService adminservice;
	@Autowired
	private ChatService chatservice;
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resource/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");

	}

	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {

		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);

		SqlSessionFactory factory = factoryBean.getObject();

		return factory;
	}
 
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	@Bean // 다른 Mapper <> 이 부분만 바꿔서 생성해주면 됨
	public MapperFactoryBean<PostMapper> PostMapper(SqlSessionFactory factory) throws Exception{
		
		MapperFactoryBean<PostMapper> factoryBean = new MapperFactoryBean<PostMapper>(PostMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<ProUserMapper> getProUserMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<ProUserMapper> factoryBean = new MapperFactoryBean<ProUserMapper>(ProUserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	//포트폴리오mapper
	@Bean
	public MapperFactoryBean<PortFolioMapper> getPortFolioMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<PortFolioMapper> factoryBean = new MapperFactoryBean<PortFolioMapper>(PortFolioMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	//찜한일류
	@Bean
	public MapperFactoryBean<InterestMapper> getInterestMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<InterestMapper> factoryBean = new MapperFactoryBean<InterestMapper>(InterestMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	// 채팅
			@Bean
			public MapperFactoryBean<ChatMapper> ChatHistoryMapper(SqlSessionFactory factory) throws Exception {

				MapperFactoryBean<ChatMapper> factoryBean = new MapperFactoryBean<ChatMapper>(ChatMapper.class);
				factoryBean.setSqlSessionFactory(factory);

				return factoryBean;
			}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);
		TopMenuInterceptor2 topMenuInterceptor2 = new TopMenuInterceptor2(loginProuserBean,chatservice);
		TopMenuInterceptor3 topMenuInterceptor3 = new TopMenuInterceptor3(AdminloginBean);
		LoginInterceptor loginInterceptor = new LoginInterceptor(loginUserBean, loginProuserBean,AdminloginBean);
		PortfolioAlarmInterceptor portfolioAlarmInterceptor = new PortfolioAlarmInterceptor(AdminAlarm,adminservice);
		ReportAlarmInterceptor reportAlarmInterceptor = new ReportAlarmInterceptor(alarmReportBean, adminservice);
		
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		InterceptorRegistration reg2 = registry.addInterceptor(topMenuInterceptor2);
		InterceptorRegistration reg5 = registry.addInterceptor(topMenuInterceptor3);
		InterceptorRegistration reg3 = registry.addInterceptor(loginInterceptor);
		InterceptorRegistration reg6 = registry.addInterceptor(portfolioAlarmInterceptor);
		InterceptorRegistration reg7 = registry.addInterceptor(reportAlarmInterceptor);
		
		reg1.addPathPatterns("/**");// 모든 요청에서 동작
		reg2.addPathPatterns("/**");// 모든 요청에서 동작
		reg5.addPathPatterns("/**");// 모든 요청에서 동작
		reg6.addPathPatterns("/**");// 모든 요청에서 동작
		reg7.addPathPatterns("/**");// 모든 요청에서 동작
		
		//reg3.addPathPatterns("/common/calendar");
		reg3.addPathPatterns("/common/myPage");
		reg3.addPathPatterns("/common/AccountModify");
		reg3.addPathPatterns("/common/AccountSetting");
		reg3.addPathPatterns("/board/modifyPost");
		reg3.addPathPatterns("/board/post");
		reg3.addPathPatterns("/common/calendar", "/common/myPage", "/common/myPosts", "/board/post");
		//reg2.excludePathPatterns("/board/main");
		
		reg3.addPathPatterns("/pro/**"); 
		
		CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, postService);
		
		InterceptorRegistration reg4 = registry.addInterceptor(checkWriterInterceptor); 
		reg4.addPathPatterns("/board/modifyPost", "/board/delete");
		
		
	}
	
	 
	// 카테고리 mapper 등록
	@Bean
	public MapperFactoryBean<ServiceCategoryMapper> getServiceCategoryMapper(SqlSessionFactory factory)
			throws Exception {

		MapperFactoryBean<ServiceCategoryMapper> factoryBean = new MapperFactoryBean<ServiceCategoryMapper>(
				ServiceCategoryMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<DetailCategoryMapper> getDetilCategoryMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<DetailCategoryMapper> factoryBean = new MapperFactoryBean<DetailCategoryMapper>(
				DetailCategoryMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<ReviewMapper> getReviewMapper(SqlSessionFactory factory)throws Exception{

		MapperFactoryBean<ReviewMapper> factoryBean = new MapperFactoryBean<ReviewMapper>(ReviewMapper.class);
		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	//캘린더
	@Bean
	public MapperFactoryBean<CalendarMapper> getCalendarMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<CalendarMapper> factoryBean = new MapperFactoryBean<CalendarMapper>(CalendarMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	} 
	
	//관리자
	@Bean
	public MapperFactoryBean<AdminMapper> getAdminMapper(SqlSessionFactory factory) throws Exception {
		
		MapperFactoryBean<AdminMapper> factoryBean = new MapperFactoryBean<AdminMapper>(AdminMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	} 
	
	//경력
		@Bean
		public MapperFactoryBean<CareerMapper> getCareerMapper(SqlSessionFactory factory) throws Exception {

			MapperFactoryBean<CareerMapper> factoryBean = new MapperFactoryBean<CareerMapper>(CareerMapper.class);

			factoryBean.setSqlSessionFactory(factory);

			return factoryBean;
		}
		
		//학력
		@Bean
		public MapperFactoryBean<EducationMapper> getEducationMapper(SqlSessionFactory factory) throws Exception {

			MapperFactoryBean<EducationMapper> factoryBean = new MapperFactoryBean<EducationMapper>(EducationMapper.class);

			factoryBean.setSqlSessionFactory(factory);

			return factoryBean;
		}
		//프로
		@Bean
		public MapperFactoryBean<ProProfileMapper> getProProfileMapper(SqlSessionFactory factory) throws Exception {

			MapperFactoryBean<ProProfileMapper> factoryBean = new MapperFactoryBean<ProProfileMapper>(ProProfileMapper.class);

			factoryBean.setSqlSessionFactory(factory);

			return factoryBean;
		}
		
	//메시지와의 충돌방지, 프로퍼티 파일과 메시지를 구분하여 별도로 관리
		@Bean
		public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
			return new PropertySourcesPlaceholderConfigurer();
		} 
	 
	// 에러 프로퍼티 파일을 메시지로 등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}

	//이미지 
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}

	//자동완성관련
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
    }
 
}
