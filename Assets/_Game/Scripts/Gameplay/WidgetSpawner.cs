using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetSpawner : MonoBehaviour
    {
        void Start()
        {
            SpawnWidget();
            InvokeRepeating("SpawnWidget", 0, 2);
        }
        
        public void SpawnWidget()
        {
            var widgetGO = WidgetPool.Instance.GetWidget();
            widgetGO.transform.SetParent(transform);
            widgetGO.transform.position = transform.position;
        }
    }
}