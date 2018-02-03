package govt_udf;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.util.WrappedIOException;

public class govt_80perc extends EvalFunc<Float>	 {

	

	@SuppressWarnings("deprecation")
	public Float exec(Tuple arg0) throws IOException {
		// Checking if parameters are null or not
		if(arg0 == null || arg0.size() == 0)
			return null;
		try {
			Integer num1 = (Integer)arg0.get(0);
			Integer num2 = (Integer)arg0.get(1);
			//Finding percentage
			Long per = Math.round(num2*100.0/num1);
			Float val = per.floatValue();
			return val;
			
		} catch (Exception e) {
			// TODO: handle exception
			throw WrappedIOException.wrap("999.99",e);
		}
	}

}
