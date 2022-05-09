package com.bookStroe.spring.H2db;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	private static EntityManager manager;
	

	public static void main(String[] args) {
		//ApplicationContext app = new ClassPathXmlApplicationContext("dbbean.xml"); //ApplicationContext의 인스턴스를 준비. 여기서는 dbbean.xml을 지정
		//-----> 수정
		ApplicationContext app = new AnnotationConfigApplicationContext(SampleEntityConfig.class);
		
		
		EntityManagerFactory factory = app.getBean(EntityManagerFactory.class); //bean설정 파일에 준비해 놓은 엔티티 관리자 팩토리 bean을 얻어옴. 여기서는 EntityManagerFactory클래스의 class값으로 인수 지정
		EntityManager manager = factory.createEntityManager(); //준비한 EntityManagerFactory에서 EntityManager를 가져옴. createEntityManager라는 메소드 호출
															   //이를 사용하여 더미 데이터를 저장하거나 혹은 전체 엔티티를 목록으로 얻어 올수 있음
		
		/* make dummy */
		makeDummyData(manager);
		
		/* update entity */
		updateEntity(1L);
		updateEntity(3L);

		/* delete entity */
		deleteEntity(1L);
		deleteEntity(3L);
		
		/* get list */
		Query query = manager.createQuery("from SampleEntity"); //해당 메소드를 호출하여 전체 엔티티 목록을 검색 //SampleEntity엔티티를 모두 취득하는 것을 나타내는 구문 //(from 엔티티)를 인수로 받으면 그 엔티티 목록을 얻을 수 있음
		List list = query.getResultList(); //호출하면, 가져온 엔티티를 목록으로 얻을 수 있음
		printList(list);
		
		System.out.println("...ok.");
	}
	
	
	
	
	
	//새로운 엔티티 추가 : 데이터베이스는 동시에 여러 곳에서 액세스되는 경우도 있음. 다른 데이터가 액세스되는 동안에 데이터가 갱신이 되거나 한다면 문제가 일어날 수 있음. (데이터 갱신이 필요한 경우에는 '트랜잭션'을 사용해야 함)
	//트랜잭션은 여러 처리를 모와서 실행 할 수 있도록 하는 기능. 지정하는 동안에는 그 처리를 실시하고 있는 해당 데이터에 대해서, 외부에서 액세스를 할 수 없게 됨. 트랜잭션 처리가 완료된 후에는 외부에서 부터 데이터 액세스 가능해 짐.
	/* create dummy entity data */
	public static void makeDummyData(EntityManager manager) {
		EntityTransaction transaction = manager.getTransaction(); //트랜재션 클래스
		
		transaction.begin(); //트랜잭션 처리 시작
			
			manager.persist(new SampleEntity("tuyano","syoda@tuyano.com")); //엔티티의 신규추가는 persist라는 메서드 사용 //인수에 엔티티클래스의 인스턴스를 지정하여 호출하는 것으로, 그 엔티티를 데이터베이스에 저장
			manager.persist(new SampleEntity("hanako","hanako@flower"));
			manager.persist(new SampleEntity("taro","taro@yamada"));
			manager.persist(new SampleEntity("sachiko","sachiko@happy"));
			
			manager.flush(); //버퍼를 비움
		
		transaction.commit(); //커밋하여 persist한 엔티티가 전부 데이터베이스에 저장됨. 커밋하면 바로 트랜잭션 처리는 종료되고, 데이터베이스는 개방됨
	}
	
	
	
	
	
	/* print all entity */
	public static void printList(List list) {
		for(Object item : list) {
			System.out.println(item);
		}
	}
	
	
	
	
	
	//업데이트는 신규 작성돠 달리, find에서 특정 id의 엔티티를 얻어서, merge 업데이트 처리를 하면 됨
	/* update entity */
	public static void updateEntity(long id) {
		SampleEntity entity =  manager.find(SampleEntity.class, id); //인스턴스를 얻어온다. new로 생성하는 것이 아니라 EntityManager의 find메소드를 호출. find의 특징은 특정 id의 엔티티를 검색하는 것. 인수에 엔티티 클래스의 class값과 검색 엔티티의 id값을 각각 지정함.
		
		/**
		 * 목록 리스트를 얻어오는 경우에는 다음 처리 등을 생각하면 귀찮긴 하지만, 이렇게 EntityManager의 메소드를 사용하면 id를 지정하는 것만으로 엔티티를 얻을 수 있음 
		 * 다만, id를 모르는 상태에서 이를 사용할 수 없음
		 */
		
		entity.setName("update name");
		entity.setMail("update@mail");
		
		EntityTransaction transaction = manager.getTransaction();
		
		transaction.begin();
		
			manager.merge(entity); //이미 저장되어 있는 엔티티의 변경은 merge라는 메소드를 사용해 실시함. 인수에 업데이트하는 엔티티 클래스의 인스턴스를 지정하면 해장 엔티티의 값을 최신 상태로 업데이트함
			
			manager.flush();
		
		transaction.commit();
	}
	
	
	
	
	
	
	/* delete entity */
	public static void deleteEntity(long id) {
		SampleEntity entity = manager.find(SampleEntity.class, id); //manager의 find를 사용하여 지정된 id의 엔티티를 얻어옴
		
		EntityTransaction transaction = manager.getTransaction();
		
		transaction.begin();
		
			manager.remove(entity);
			
			manager.flush();
			
		transaction.commit();
	}
	
}
