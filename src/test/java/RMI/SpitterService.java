package RMI;

import java.util.List;

/**
 * Created by apple on 16/10/26.
 */
public interface SpitterService {
    List<Spittle> getRecentSpittles(int count);
    void saveSpittle();
}
